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
    const headerRect = header.getBoundingClientRect();
    const modal = document.getElementById("menuList");
    const modalTop = headerRect.bottom;
    
    // modal.style.top = modalTop + "px";
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
