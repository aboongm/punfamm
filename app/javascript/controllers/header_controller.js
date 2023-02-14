// import { Controller } from '@hotwired/stimulus';
// import { leave, toggle } from 'el-transition';

// export default class extends Controller {
//   // static targets = ['openUserMenu', 'userAuthLink'];
//   static targets = ['userAuthLink'];

//   connect() {
//     // this.openUserMenuTarget.addEventListener('click', this.toggleDropdownMenu);
        
//     this.userAuthLinkTargets.forEach((link) => {
//       link.addEventListener('click', (e) => {
//         e.preventDefault();
//         console.log('Header controller connected');
//         document.getElementById('user-auth-modal-trigger').click();
//         // document.getElementById('modal-wrapper').click();
//       });
//     });

//     const header = document.getElementById('myHeader');
//     const sticky = header.offsetTop;

//     myFunction(header, sticky) {
//       if (window.pageYOffset > sticky) {
//         header.classList.add("sticky");
//       } else {
//         header.classList.remove("sticky");
//       }
//     }
//   }
  
//   toggleDropdownMenu() {
//     toggle(document.getElementById('menu-dropdown-items'));
//   }
  
//   myFunction(header) {
//     if (window.pageYOffset > sticky) {
//       header.classList.add("sticky");
//     } else {
//       header.classList.remove("sticky");
//     }
//   }
// }

import { Controller } from '@hotwired/stimulus';
import { toggle } from 'el-transition';

export default class extends Controller {
  static targets = ['userAuthLink'];

  connect() {
    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        console.log('Header controller connected');
        document.getElementById('user-auth-modal-trigger').click();
      });
    });

    const header = document.getElementById('header');
    const sticky = header.offsetTop;

    window.onscroll = () => {
      this.myFunction(header, sticky)
    };
  }
  
  toggleDropdownMenu() {
    toggle(document.getElementById('menu-dropdown-items'));
  }
  
  myFunction(header, sticky) {
    if (window.pageYOffset > sticky) {
      header.classList.add("sticky");
    } else {
      header.classList.remove("sticky");
    }
  }
}
