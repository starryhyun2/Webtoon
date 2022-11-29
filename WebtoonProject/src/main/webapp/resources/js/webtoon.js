

 <!-- Initialize Swiper -->
   
      var swiper = new Swiper(".mySwiper", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        coverflowEffect: {
          rotate: 50,
          stretch: 0,
          depth: 100,
          modifier: 1,
          slideShadows: true,
        },
        pagination: {
          el: ".swiper-pagination",
        },
         autoplay: {
   			delay: 2000,
 		},
      });
      
      
      const nav_list = document.getElementsByClassName('nav_list');
      
      for (let i = 0; i< nav_list.length; i++) {
  
      	nav_list[i].addEventListener('mouseover', () => {
      	
      	nav_list[i].classList.add("line");
      	
      	});
      	
      	nav_list[i].addEventListener('mouseout', () => {
      	
      	nav_list[i].classList.remove("line");
      	
      	});
     
    
      }
      
      
    