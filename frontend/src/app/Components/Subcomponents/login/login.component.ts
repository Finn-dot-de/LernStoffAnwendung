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

  async hashPassword(password: string): Promise<string> {
    const salt = await bcrypt.genSalt(10);
    return await bcrypt.hash(password, salt);
  }

  async login() {
    const hashedPassword = await this.hashPassword(this.password);
    const loginData = {
      username: this.username,
      password: hashedPassword
    };

    // Senden die Anmeldedaten an den Server
    const response = await fetch('/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(loginData)
    });

    if (response.ok) {
      alert("Eingelogt")
    } else {
      alert("Fehler")
    }
  }
}
