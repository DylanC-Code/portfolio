<script lang="ts">
	import NavCard from './NavCard/NavCard.svelte';
</script>

<nav class="md:hidden">
	<ul class="grid h-dvh grid-cols-1 gap-6 p-6 sm:grid-cols-2">
		<NavCard text="About me" hash="about" logo="user" />
		<NavCard text="My portfolio" hash="portfolio" logo="briefcase" />
		<NavCard text="Get in touch" hash="contact" logo="envelope-open" />
		<NavCard text="My blog" hash="blog" logo="comments" />
	</ul>
</nav>
