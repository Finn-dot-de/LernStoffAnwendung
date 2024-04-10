import { Component } from '@angular/core';
import { DropdownComponent } from '../dropdown/dropdown.component';

@Component({
  selector: 'app-header',
  standalone: true,
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss',
  imports: [DropdownComponent],
})
export class HeaderComponent {
  options1 = [
    { name: 'AWP', link: '/awp' },
    { name: 'PlusD', link: '/plusd' },
    { name: 'ITs', link: '/its' },
    { name: 'ITTk', link: '/ittk' },
    { name: 'ITTa / ITTab', link: '/itta-ittab' },
  ];
  options2 = [
    { name: 'Schnellübung', link: '/schnelluebung' },
    { name: 'Normale Übung', link: '/normaluebungen' },
    { name: 'Intensiveübungen', link: '/intensiveuebungen' },
    { name: 'Mischübungen', link: '/mischuebungen' },
  ];

  options3 = [
    { name: 'Langzeit', link: '/langzeit' },
    { name: 'Noch zu Üben', link: '/nochzueben' },
    { name: 'Eigene Übungen erstellen', link: '/eigeneuebungen' },
  ];

  selectedValue1 = 'Fächer';
  selectedValue2 = 'Übungen';
  selectedValue3 = 'Lernfortschritt';
}