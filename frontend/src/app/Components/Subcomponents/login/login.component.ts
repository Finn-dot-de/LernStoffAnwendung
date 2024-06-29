// login.component.ts
import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormsModule, NgModel } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true,
  imports: [FormsModule]
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private http: HttpClient) {}

  login(event: Event) {
    event.preventDefault();

    const loginData = {
      username: this.username,
      password: this.password
    };

    this.http.post('/api/login', loginData).subscribe({
      next: (response) => {
        console.log('Login successful', response);
        alert("It worked")
      },
      error: (error) => {
        console.error('Login failed', error);
        alert("Did not worked")
      }
    });
  }
}
