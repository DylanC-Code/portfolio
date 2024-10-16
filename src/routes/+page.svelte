<script lang="ts">
	import Portfolio from '$components/Portfolio/Portfolio.svelte';
	import Project from '$components/Project/Project.svelte';
	import About from '$lib/components/About/About.svelte';
	import Contact from '$lib/components/Contact/Contact.svelte';
	import Home from '$lib/components/Home/Home.svelte';
	import Page from '$lib/components/Page/Page.svelte';
	import navigationHistory from '$lib/stores/navigationHistory';
	import type { IProject } from '$types/index';

	const projects: Array<IProject> = [
		{
			format: 'Image',
			name: 'Website',
			budget: { devise: 'USD', price: 1500 },
			client: 'Ecom Wisdom Media',
			duration: '5 months',
			technologies: ['React', 'Shopify'],
			img: '/project-1.jpg',
			url: 'https://google.com'
		}
	];
	$: console.log('nav history', $navigationHistory);
</script>

<Page name="home" component={Home} classes="hidden lg:block" />
<Page name="about" component={About} />
<Page name="contact" component={Contact} />
<Page name="portfolio" component={Portfolio} props={{ projects }} />

{#each projects as project, index}
	<Page name={`project-${index}`} component={Project} props={{ project }} />
{/each}
