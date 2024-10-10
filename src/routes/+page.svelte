<script>
	import { onMount } from 'svelte';
	import { _currentPage } from './+layout';
	import { browser } from '$app/environment';

	onMount(() => {
		if (!browser) return;

		const aElements = document.querySelectorAll('a');

		aElements.forEach((el) => {
			el.addEventListener('click', (e) => {
				e.preventDefault();

				if (!el.hash) return;

				aElements.forEach((el) => {
					const id = el.hash.replace('#', '');
					if (!id) return;
					document.getElementById(id).classList.remove('page-section-active');
				});

				const id = el.hash.replace('#', '');
				if (!id) return;

				document.getElementById(id).classList.add('page-section-active');
			});
		});
	});
</script>

<main class="h-full w-full">
	<section id="home" class="page-section">Home</section>
	<section id="about" class="page-section">about</section>
	<section id="portfolio" class="page-section">aaa</section>
	<section id="contact" class="page-section"></section>
	<section id="blog" class="page-section"></section>
</main>
