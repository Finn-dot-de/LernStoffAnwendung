import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import * as bcrypt from 'bcryptjs';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private http: HttpClient) {}

  PassWandler(word: string): string {
    const salt = bcrypt.genSaltSync(10);
    const hashedPassword = bcrypt.hashSync(word, salt);
    return hashedPassword;
  }

  login() {
    const hashedPassword = this.PassWandler(this.password);
    const loginData = {
      username: this.username,
      password: hashedPassword
    };

    this.http.post('/api/login', loginData).subscribe({
      next: (response) => {
        console.log('Login successful', response);
      },
      error: (error) => {
        console.error('Login failed', error);
      }
    });
  }
}
