import { Component } from '@angular/core';
import { DropdownComponent } from '../dropdown/dropdown.component';

@Component({
    selector: 'app-header',
    standalone: true,
    templateUrl: './header.component.html',
    styleUrl: './header.component.scss',
    imports: [DropdownComponent]
})
export class HeaderComponent {
  options1 = ['AWP', 'PlusD', 'ITS', 'ITTk', 'ITTa / ITTab'];
  options2 = ['Schnellübung', 'Intensiveübungen', 'Mischübungen'];
  options3 = ['Langzeit', 'Noch zu Üben', 'Eigene Übungen erstellen'];

  selectedValue1 = 'Fächer';
  selectedValue2 = 'Übungen';
  selectedValue3 = 'Lernfortschritt';
}
