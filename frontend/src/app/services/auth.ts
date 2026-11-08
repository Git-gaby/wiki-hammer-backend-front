import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private http = inject(HttpClient);
  // Puerto de tu backend en Express (cámbialo si tu servidor corre en otro puerto)
  private API_URL = 'http://localhost:2508/api';

  // Enviar credenciales al backend y almacenar el token devuelto
  login(credenciales: { email: string; password: string }): Observable<any> {
    return this.http.post<any>(`${this.API_URL}/login`, credenciales).pipe(
      tap((res) => {
        if (res && res.token) {
          localStorage.setItem('token', res.token);
        }
      })
    );
  }

  // Obtener el JWT almacenado en el navegador
  getToken(): string | null {
    return localStorage.getItem('token');
  }

  // Verificar si hay sesión activa para los guards
  isLoggedIn(): boolean {
    return !!this.getToken();
  }

  // Limpiar sesión al desconectarse
  logout(): void {
    localStorage.removeItem('token');
  }
}