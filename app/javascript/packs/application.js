import "bootstrap";

import { selectFighters } from '../plugins/select_fighters.js.erb';
import { battleAttack } from '../plugins/battle_attack.js.erb';

selectFighters();
battleAttack();
