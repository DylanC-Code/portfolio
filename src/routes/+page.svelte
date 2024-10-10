<script lang="ts">
	import { _currentPage } from './+layout';
</script>

<main class="absolute h-full w-full overflow-hidden">
	<section id="home" class="page-section" class:page-section-active={$_currentPage === 'home'}>
		Home
	</section>
	<section id="about" class="page-section" class:page-section-active={$_currentPage === 'about'}>
		about
	</section>
	<section
		id="portfolio"
		class="page-section"
		class:page-section-active={$_currentPage === 'azeaze'}
	></section>
	<section
		id="contact"
		class="page-section"
		class:page-section-active={$_currentPage === 'azeaze'}
	></section>
	<section
		id="blog"
		class="page-section"
		class:page-section-active={$_currentPage === 'azeaze'}
	></section>
</main>
