import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:2508/api';

  login(credenciales: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/login`, credenciales).pipe(
      tap((res) => {
        const token = res.token || res.jwt;
        if (token) {
          localStorage.setItem('token', token);
        }

        // Si el backend devuelve el objeto usuario con su rol:
        const usuario = res.usuario || res.data || res.user;
        if (usuario) {
          localStorage.setItem('usuario', JSON.stringify(usuario));
        } else if (token) {
          // Si el rol viene empaquetado dentro del payload del token JWT
          try {
            const payload = JSON.parse(atob(token.split('.')[1]));
            localStorage.setItem('usuario', JSON.stringify(payload));
          } catch (e) {
            console.error('No se pudo decodificar el payload del token', e);
          }
        }
      })
    );
  }

  register(datosUsuario: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/registro`, datosUsuario);
  }

  getToken(): string | null {
    return localStorage.getItem('token');
  }

  getUsuario(): any {
    const usuarioRaw = localStorage.getItem('usuario');
    return usuarioRaw ? JSON.parse(usuarioRaw) : null;
  }

  // Método clave para la Misión 9: determina si se muestran botones de admin
  esAdmin(): boolean {
    const usuario = this.getUsuario();
    return usuario?.rol === 'admin';
  }

  logout(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('usuario');
  }

  isLoggedIn(): boolean {
    return !!localStorage.getItem('token');
  }
}