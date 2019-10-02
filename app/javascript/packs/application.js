import "bootstrap";

import { selectFighters } from '../plugins/select_fighters.js.erb';
import { battleAttack } from '../plugins/battle_attack.js.erb';
import { updateOnChange } from '../plugins/update_fighter_on_change.js.erb';

selectFighters();

setTimeout(battleAttack, 3000);

updateOnChange();

