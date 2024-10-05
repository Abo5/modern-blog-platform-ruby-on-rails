document.addEventListener('turbo:load', function() {
    function setupEventListeners() {
      const newArticleBtn = document.getElementById('newArticleBtn');
      const newArticleSidebar = document.getElementById('newArticleSidebar');
      const closeNewArticleSidebarBtn = document.getElementById('closeNewArticleSidebar');
      const menuToggle = document.getElementById('menuToggle');
      const sidebar = document.getElementById('sidebar');
      const sidebarClose = document.getElementById('sidebarClose');
      const mainContent = document.querySelector('.main-content');
      const gridViewBtn = document.getElementById('gridViewBtn');
      const listViewBtn = document.getElementById('listViewBtn');
      const articlesGrid = document.getElementById('articlesContainer');
  
      if (newArticleBtn && newArticleSidebar) {
        newArticleBtn.addEventListener('click', () => {
          newArticle();
        });
      }
  
      if (closeNewArticleSidebarBtn && newArticleSidebar) {
        closeNewArticleSidebarBtn.addEventListener('click', () => {
          newArticleSidebar.classList.remove('open');
        });
      }
  
      if (menuToggle && sidebar && mainContent) {
        menuToggle.addEventListener('click', () => {
          sidebar.classList.toggle('open');
          mainContent.classList.toggle('sidebar-expanded');
        });
      }
  
      if (sidebarClose && sidebar && mainContent) {
        sidebarClose.addEventListener('click', () => {
          sidebar.classList.remove('open');
          mainContent.classList.remove('sidebar-expanded');
        });
      }
  
      if (sidebar && mainContent) {
        sidebar.addEventListener('mouseenter', () => {
          sidebar.classList.add('hovered');
          mainContent.classList.add('sidebar-expanded');
        });
  
        sidebar.addEventListener('mouseleave', () => {
          sidebar.classList.remove('hovered');
          if (!sidebar.classList.contains('open')) {
            mainContent.classList.remove('sidebar-expanded');
          }
        });
      }
  
      if (gridViewBtn && listViewBtn && articlesGrid) {
        gridViewBtn.addEventListener('click', () => {
          articlesGrid.classList.remove('list-view');
          articlesGrid.classList.add('grid-view');
          gridViewBtn.classList.add('active');
          listViewBtn.classList.remove('active');
        });
  
        listViewBtn.addEventListener('click', () => {
          articlesGrid.classList.remove('grid-view');
          articlesGrid.classList.add('list-view');
          listViewBtn.classList.add('active');
          gridViewBtn.classList.remove('active');
        });
      }
    }
  
    setupEventListeners();
  
    // Event delegation for edit and delete buttons
    document.addEventListener('click', (e) => {
      if (e.target.closest('.edit-btn')) {
        const articleId = e.target.closest('.edit-btn').dataset.id;
        editArticle(articleId);
      } else if (e.target.closest('.delete-btn')) {
        const articleId = e.target.closest('.delete-btn').dataset.id;
        if (confirm('Are you sure you want to delete this article?')) {
          deleteArticle(articleId);
        }
      } else if (e.target.id === 'closeNewArticleSidebar') {
        const newArticleSidebar = document.getElementById('newArticleSidebar');
        if (newArticleSidebar) {
          newArticleSidebar.classList.remove('open');
        }
      }
    });
  
    function deleteArticle(id) {
      fetch(`/blog_articles/${id}`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Accept': 'text/vnd.turbo-stream.html'
        }
      })
      .then(response => {
        if (!response.ok) throw new Error('Network response was not ok');
        return response.text();
      })
      .then(html => {
        Turbo.renderStreamMessage(html);
      })
      .catch(error => {
        console.error('Error:', error);
      });
    }

    function editArticle(id) {
      fetch(`/blog_articles/${id}/edit`, {
        headers: {
          'Accept': 'text/html'
        }
      })
      .then(response => response.text())
      .then(html => {
        const newArticleSidebar = document.getElementById('newArticleSidebar');
        newArticleSidebar.innerHTML = html;
        newArticleSidebar.classList.add('open');
      })
      .catch(error => {
        console.error('Error:', error);
      });
    }

    function newArticle() {
      fetch('/blog_articles/new', {
        headers: {
          'Accept': 'text/html'
        }
      })
      .then(response => response.text())
      .then(html => {
        const newArticleSidebar = document.getElementById('newArticleSidebar');
        newArticleSidebar.innerHTML = html;
        newArticleSidebar.classList.add('open');
      })
      .catch(error => {
        console.error('Error:', error);
      });
    }
  });