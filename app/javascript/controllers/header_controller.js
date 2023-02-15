import { Controller } from '@hotwired/stimulus';
import { enter, leave, toggle } from 'el-transition';

export default class extends Controller {
  static targets = ['openMenu', 'searchNews', 'closeMenu', 'userAuthLink'];

  connect() {
    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        document.getElementById('user-auth-modal-trigger').click();
      });
    });
    
    this.openMenuTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        enter(document.getElementById('menuList'))
      });
    });
    
    this.searchNewsTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        enter(document.getElementById('menuList'))
      });
    });

    this.closeMenuTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        leave(document.getElementById('menuList'))
      });
    });
    
    const header = document.getElementById('header');
    const sticky = header.offsetTop;
    const headerRect = header.getBoundingClientRect();
    // const modal = document.getElementById("menuList");
    // const modalTop = headerRect.bottom;
    
    window.onscroll = () => {
      this.myFunction(header, sticky)
    };
  }
  
  // toggleDropdownMenu() {
  //   toggle(document.getElementById('menu-dropdown-items'));
  // }
  
  myFunction(header, sticky) {
    if (window.pageYOffset > sticky) {
      header.classList.add("sticky");
    } else {
      header.classList.remove("sticky");
    }
  }
}
