import { Routes } from '@angular/router';
import { Home } from './components/home/home';
import { Login } from './components/login/login';
import { authGuard } from './guards/auth-guard'; 
import { loginGuard } from './guards/login-guard';

export const routes: Routes = [
  // Ruta por defecto: si entra vacío, redirige a /home
  { path: '', redirectTo: 'home', pathMatch: 'full' },

  // Vistas de la aplicación
  { path: 'home', component: Home },
  { path: 'login', component: Login },

  // Comodín para URLs no encontradas
  { path: '**', redirectTo: 'home' }
];