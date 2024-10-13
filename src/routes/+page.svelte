<script>
	import { onMount } from 'svelte';
	import { _currentPage } from './+layout';
	import { browser } from '$app/environment';
	import Home from '../lib/Home/Home.svelte';
	import About from '$lib/About/About.svelte';

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
					const pageSectionElement = document.getElementById(id);
					if (pageSectionElement) pageSectionElement.classList.remove('page-section-active');
				});

				const id = el.hash.replace('#', '');
				if (!id) return;

				document.getElementById(id).classList.add('page-section-active');
			});
		});
	});
</script>

<Home />
<About />
<section id="portfolio" class="page-section">aaa</section>
<section id="contact" class="page-section"></section>
<section id="blog" class="page-section"></section>
