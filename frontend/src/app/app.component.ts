import { Component } from '@angular/core';
import { FooterComponent } from "./maincomponents/footer/footer.component";
import { HeaderComponent } from "./maincomponents/header/header.component";
import { RouterOutlet } from '@angular/router';

@Component({
    selector: 'app-root',
    standalone: true,
    templateUrl: './app.component.html',
    styleUrl: './app.component.scss',
    imports: [FooterComponent, HeaderComponent, RouterOutlet]
})
export class AppComponent {
  title = 'LWB_App';
}
