<script>
	import { onMount } from 'svelte';
	import { browser } from '$app/environment';
	import About from '$lib/components/About/About.svelte';
	import Home from '$lib/components/Home/Home.svelte';
	import Contact from '$lib/components/Contact/Contact.svelte';

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
				const sectionEl = document.getElementById(id);
				if (sectionEl) sectionEl.classList.add('page-section-active');
			});
		});
	});
</script>

<Home />
<About />
<Contact />
<section id="portfolio" class="page-section">aaa</section>
<section id="blog" class="page-section"></section>
