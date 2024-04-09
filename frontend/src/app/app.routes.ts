import { Routes } from '@angular/router';
import { AwpComponent } from './sites/awp/awp.component';
import { PlusdComponent } from './sites/plusd/plusd.component';
import { ItsComponent } from './sites/its/its.component';
import { IttkComponent } from './sites/ittk/ittk.component';
import { IttaComponent } from './sites/itta/itta.component';
import { SchnelluebungComponent } from './sites/schnelluebung/schnelluebung.component';
import { IntensiveuebungenComponent } from './sites/intensiveuebungen/intensiveuebungen.component';
import { MischuebungenComponent } from './sites/mischuebungen/mischuebungen.component';
import { LangzeitComponent } from './sites/langzeit/langzeit.component';
import { NochzuebenComponent } from './sites/nochzueben/nochzueben.component';
import { EigeneuebungenComponent } from './sites/eigeneuebungen/eigeneuebungen.component';
import { NormaluebungenComponent } from './sites/normaluebungen/normaluebungen.component';

export const routes: Routes = [
  { path: 'awp', component: AwpComponent },
  { path: 'plusd', component: PlusdComponent },
  { path: 'its', component: ItsComponent },
  { path: 'ittk', component: IttkComponent },
  { path: 'itta', component: IttaComponent },
  { path: 'schnelluebung', component: SchnelluebungComponent },
  { path: 'intensiveuebungen', component: IntensiveuebungenComponent },
  { path: 'mischuebungen', component: MischuebungenComponent },
  { path: 'langzeit', component: LangzeitComponent },
  { path: 'nochzueben', component: NochzuebenComponent },
  { path: 'eigeneuebungen', component: EigeneuebungenComponent },
  { path: 'normaluebungen', component: NormaluebungenComponent },
];
