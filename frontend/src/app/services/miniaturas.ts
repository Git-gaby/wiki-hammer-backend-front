import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { Miniatura, MiniaturasResponse } from '../models/miniature.model';

@Injectable({
  providedIn: 'root'
})
export class MiniaturasService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:2508/api/miniaturas';

  // Obtenemos directamente el array que viene dentro de res.data
  getMiniaturas(): Observable<Miniatura[]> {
    return this.http.get<MiniaturasResponse>(this.apiUrl).pipe(
      map(res => res.data)
    );
  }
}