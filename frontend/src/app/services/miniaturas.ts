import { Injectable, inject } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { Miniatura, MiniaturasResponse } from '../models/miniature.model';
import { AuthService } from './auth';

@Injectable({
  providedIn: 'root'
})
export class MiniaturasService {
  private http = inject(HttpClient);
  private authService = inject(AuthService);
  private apiUrl = 'http://localhost:2508/api/miniaturas';

  private getAuthHeaders(): HttpHeaders {
    const token = this.authService.getToken() || '';
    return new HttpHeaders({
      'Authorization': `Bearer ${token}`
    });
  }

  // GET: Público
  getMiniaturas(): Observable<Miniatura[]> {
    return this.http.get<MiniaturasResponse>(this.apiUrl).pipe(
      map(res => res.data)
    );
  }

  // POST: Crear (Admin)
  crearMiniatura(miniatura: Miniatura): Observable<any> {
    return this.http.post(this.apiUrl, miniatura, {
      headers: this.getAuthHeaders()
    });
  }

  // PUT: Actualizar (Admin)
  actualizarMiniatura(id: number, miniatura: Miniatura): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, miniatura, {
      headers: this.getAuthHeaders()
    });
  }

  // DELETE: Eliminar (Admin)
  eliminarMiniatura(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`, {
      headers: this.getAuthHeaders()
    });
  }
}