<script lang="ts">
	import currentPage from '$lib/stores/currentPage';
	import NavCard from './NavCard/NavCard.svelte';
</script>

<nav class="h-dvh md:hidden" class:hidden={$currentPage !== 'home'}>
	<!-- svelte-ignore a11y-click-events-have-key-events -->
	<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
	<ul class="grid h-dvh grid-cols-1 gap-6 p-6 sm:grid-cols-2">
		<NavCard text="About me" hash="about" logo="user" />
		<NavCard text="My portfolio" hash="portfolio" logo="briefcase" />
		<NavCard text="Get in touch" hash="contact" logo="envelope-open" />
		<NavCard text="My blog" hash="blog" logo="comments" />
	</ul>
</nav>
