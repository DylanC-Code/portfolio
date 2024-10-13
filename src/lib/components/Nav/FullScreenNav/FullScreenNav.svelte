<script lang="ts">
	import currentPage from '$lib/stores/currentPage';
	import NavCard from './NavCard/NavCard.svelte';
</script>

<div class="md:hidden" class:hidden={$currentPage !== 'home'}>
	<ul class="flex h-screen flex-col gap-6 p-6">
		<NavCard text="About me" hash="about" logo="user" />
		<NavCard text="My portfolio" hash="portfolio" logo="briefcase" />
		<NavCard text="Get in touch" hash="contact" logo="envelope-open" />
		<NavCard text="My blog" hash="blog" logo="comments" />
	</ul>
</div>
