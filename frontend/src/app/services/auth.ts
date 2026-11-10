import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private http = inject(HttpClient);
  // Puerto 2508 y prefijo /api
  private apiUrl = 'http://localhost:2508/api';

  login(credenciales: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/login`, credenciales).pipe(
      tap((res) => {
        // Tu backend suele devolver { token: "..." } o { token: res.token }
        const token = res.token || res.jwt;
        if (token) {
          localStorage.setItem('token', token);
        }
      })
    );
  }

  // Corregido: apunta a /registro, que es como se llama en tu router
  register(datosUsuario: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/registro`, datosUsuario);
  }

    // Obtener el JWT almacenado en el navegador
  getToken(): string | null {
    return localStorage.getItem('token');
  }


  logout(): void {
    localStorage.removeItem('token');
  }

  isLoggedIn(): boolean {
    return !!localStorage.getItem('token');
  }
}
