import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { MiniaturasService } from '../../services/miniaturas';
import { Miniatura } from '../../models/miniature.model';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home implements OnInit {
  private miniaturasService = inject(MiniaturasService);
  private authService = inject(AuthService);
  private router = inject(Router);

  miniaturas: Miniatura[] = [];
  cargando: boolean = true;
  errorCarga: string = '';

  // Filtros
  searchTerm: string = '';
  selectedFaccion: string = 'todas';
  faccionesDisponibles: string[] = [];

  ngOnInit(): void {
    this.cargarMiniaturas();
  }

  cargarMiniaturas(): void {
    this.cargando = true;
    this.miniaturasService.getMiniaturas().subscribe({
      next: (datos) => {
        this.miniaturas = datos;
        // Extraer facciones únicas para el selector de filtro
        const listaFacciones = datos.map(m => m.faccion);
        this.faccionesDisponibles = Array.from(new Set(listaFacciones));
        this.cargando = false;
      },
      error: (err) => {
        console.error('Error al cargar miniaturas:', err);
        this.errorCarga = 'Fallo de enlace con los Archivos Imperiales.';
        this.cargando = false;
      }
    });
  }

  // Miniaturas filtradas en tiempo real
  get miniaturasFiltradas(): Miniatura[] {
    return this.miniaturas.filter(min => {
      const coincideTexto = min.nombre.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                            min.faccion.toLowerCase().includes(this.searchTerm.toLowerCase());
      const coincideFaccion = this.selectedFaccion === 'todas' || min.faccion === this.selectedFaccion;
      return coincideTexto && coincideFaccion;
    });
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}