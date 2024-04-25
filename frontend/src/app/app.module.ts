import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FooterComponent } from './Components/maincomponents/footer/footer.component';
import { HeaderComponent } from './Components/maincomponents/header/header.component';
import { LoginComponent } from './Components/Subcomponents/login/login.component';

@NgModule({
    declarations: [
        AppComponent
    ],
    providers: [],
    bootstrap: [AppComponent],
    imports: [
        BrowserModule,
        AppRoutingModule,
        FooterComponent,
        HeaderComponent,
        LoginComponent
    ]
})
export class AppModule { }
