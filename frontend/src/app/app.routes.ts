import { Routes } from '@angular/router';
import { Home } from './components/home/home';
import { Login } from './components/login/login';
import { authGuard } from './guards/auth-guard'; 
import { loginGuard } from './guards/login-guard';

export const routes: Routes = [
  // Ruta por defecto: si entra a la raíz, mandar a login (o home si el guard lo evalúa)
  { path: '', redirectTo: 'login', pathMatch: 'full' },

  // Home blindado: solo entra con token
  { path: 'home', component: Home, canActivate: [authGuard] },

  // Login blindado al revés: si ya está logueado, loginGuard lo manda a home
  { path: 'login', component: Login, canActivate: [loginGuard] },

  // Comodín para URLs no encontradas: mandar a login
  { path: '**', redirectTo: 'login' }
];