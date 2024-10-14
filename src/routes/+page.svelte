<script>
	import About from '$lib/components/About/About.svelte';
	import Contact from '$lib/components/Contact/Contact.svelte';
	import Home from '$lib/components/Home/Home.svelte';
	import Page from '$lib/components/Page/Page.svelte';
</script>

<Page name="home" component={Home} />
<Page name="about" component={About} />
<Page name="contact" component={Contact} />
<!-- <Page name="portfolio" component={Contact} />
<Page name="blog" component={Contact} /> -->
