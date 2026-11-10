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

  // Estado de Administrador
  get esAdmin(): boolean {
    return this.authService.esAdmin();
  }

  // Gestión de Modal / Forja
  mostrarModalForja: boolean = false;
  modoEdicion: boolean = false;
  miniaturaForm: Miniatura = this.inicializarForm();
  mensajeForja: string = '';

  ngOnInit(): void {
    this.cargarMiniaturas();
  }

  inicializarForm(): Miniatura {
    return {
      nombre: '',
      grupo: 'Imperium',
      faccion: '',
      edicion: '10th',
      peana: '32mm',
      imagen: ''
    };
  }

  cargarMiniaturas(): void {
    this.cargando = true;
    this.miniaturasService.getMiniaturas().subscribe({
      next: (datos) => {
        this.miniaturas = datos;
        const listaFacciones = datos.map(m => m.faccion.trim());
        this.faccionesDisponibles = Array.from(new Set(listaFacciones));
        this.cargando = false;
      },
      error: (err) => {
        console.error('Error al cargar miniaturas:', err);
        this.errorCarga = 'Fallo al comunicar con los Archivos Imperiales.';
        this.cargando = false;
      }
    });
  }

  get miniaturasFiltradas(): Miniatura[] {
    return this.miniaturas.filter(min => {
      const coincideTexto = min.nombre.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                            min.faccion.toLowerCase().includes(this.searchTerm.toLowerCase());
      const coincideFaccion = this.selectedFaccion === 'todas' || min.faccion === this.selectedFaccion;
      return coincideTexto && coincideFaccion;
    });
  }

  // Abrir modal para Crear
  abrirCrear(): void {
    this.modoEdicion = false;
    this.miniaturaForm = this.inicializarForm();
    this.mensajeForja = '';
    this.mostrarModalForja = true;
  }

  // Abrir modal para Editar
  abrirEditar(min: Miniatura): void {
    this.modoEdicion = true;
    this.miniaturaForm = { ...min };
    this.mensajeForja = '';
    this.mostrarModalForja = true;
  }

  cerrarModal(): void {
    this.mostrarModalForja = false;
  }

  guardarMiniatura(): void {
    if (!this.miniaturaForm.nombre || !this.miniaturaForm.faccion || !this.miniaturaForm.peana) {
      this.mensajeForja = 'Debes llenar los campos obligatorios.';
      return;
    }

    if (this.modoEdicion && this.miniaturaForm.id) {
      this.miniaturasService.actualizarMiniatura(this.miniaturaForm.id, this.miniaturaForm).subscribe({
        next: () => {
          this.cerrarModal();
          this.cargarMiniaturas();
        },
        error: (err) => {
          this.mensajeForja = err.error?.mensaje || 'Error al actualizar la reliquia.';
        }
      });
    } else {
      this.miniaturasService.crearMiniatura(this.miniaturaForm).subscribe({
        next: () => {
          this.cerrarModal();
          this.cargarMiniaturas();
        },
        error: (err) => {
          this.mensajeForja = err.error?.mensaje || 'Error al consagrar la nueva reliquia.';
        }
      });
    }
  }

  eliminarMiniatura(min: Miniatura): void {
    if (!min.id) return;
    const confirmacion = window.confirm(`¿Confirmas la purga de la reliquia "${min.nombre}" de los registros imperiales?`);
    if (confirmacion) {
      this.miniaturasService.eliminarMiniatura(min.id).subscribe({
        next: () => {
          this.cargarMiniaturas();
        },
        error: (err) => {
          alert(err.error?.mensaje || 'Error al eliminar la miniatura.');
        }
      });
    }
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}