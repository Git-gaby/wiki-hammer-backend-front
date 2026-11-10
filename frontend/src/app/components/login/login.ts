import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class Login {
  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private router = inject(Router);

  isRegisterMode: boolean = false;
  errorMessage: string = '';
  successMessage: string = '';

  // Sincronizado con los nombres exactos del backend: nombre, email, password
  loginForm: FormGroup = this.fb.group({
    nombre: [''],
    email: ['', [Validators.required]],
    password: ['', [Validators.required, Validators.minLength(4)]]
  });

  toggleMode(): void {
    this.isRegisterMode = !this.isRegisterMode;
    this.errorMessage = '';
    this.successMessage = '';
    this.loginForm.reset();

    const nombreControl = this.loginForm.get('nombre');
    const emailControl = this.loginForm.get('email');

if (this.isRegisterMode) {
    nombreControl?.setValidators([Validators.required, Validators.minLength(3)]);
    // En registro sí obligamos a que el email sea un correo válido
    emailControl?.setValidators([Validators.required, Validators.email]);
  } else {
    nombreControl?.clearValidators();
    // En login permitimos que sea correo o nombre de usuario
    emailControl?.setValidators([Validators.required]);
  }

  nombreControl?.updateValueAndValidity();
  emailControl?.updateValueAndValidity();
}

  onSubmit(): void {
    if (this.loginForm.invalid) {
      this.loginForm.markAllAsTouched();
      return;
    }

    this.errorMessage = '';
    this.successMessage = '';
    const formValues = this.loginForm.value;

    if (this.isRegisterMode) {
      // Envía { nombre, email, password }
      this.authService.register(formValues).subscribe({
        next: (res: any) => {
          this.successMessage = res.mensaje || 'Registro completado con gloria. Ahora inicia sesión.';
          this.toggleMode();
        },
        error: (err: any) => {
          console.error('Error en registro:', err);
          this.errorMessage = err.error?.mensaje || 'Fallo al registrar usuario en el archivo.';
        }
      });
    } else {
      // Envía { email, password }
      const credenciales = {
        email: formValues.email,
        password: formValues.password
      };

      this.authService.login(credenciales).subscribe({
        next: () => {
          this.router.navigate(['/home']);
        },
        error: (err: any) => {
          console.error('Error en login:', err);
          this.errorMessage = err.error?.mensaje || 'Credenciales inválidas.';
        }
      });
    }
  }
}