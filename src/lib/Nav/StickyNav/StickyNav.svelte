<script lang="ts">
	import Burger from './Burger.svelte';
	import NavLink from './NavLink.svelte';

	let navContainer: HTMLDivElement;

	let visible = false;
	const toggleNavVisibility = () => (visible = !visible);
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-static-element-interactions -->
<div
	class="invisible md:visible z-20 fixed top-[30px] left-[30px]"
	bind:this={navContainer}
	on:click={toggleNavVisibility}
>
	<Burger {visible} />

	<!-- {#if visible} -->
	<ul class="relative pt-[53px] pb-[22px] z-20" class:invisible={!visible}>
		<NavLink delay={0.05} iconName="house" text="Home" />
		<NavLink delay={0.1} iconName="user" text="About" />
		<NavLink delay={0.15} iconName="briefcase" text="Portfolio" />
		<NavLink delay={0.2} iconName="envelope-open" text="Contact" />
		<NavLink delay={0.25} iconName="comments" text="Blog" />
	</ul>
	<!-- {/if} -->

	<span
		aria-hidden="true"
		class="absolute z-10 top-0 left-0 w-[60px] h-[60px] bg-[#333] rounded-[30px] duration-200"
		class:h-full={visible}
	></span>
</div>
