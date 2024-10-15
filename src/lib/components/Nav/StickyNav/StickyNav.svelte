<script lang="ts">
	import Burger from './Burger.svelte';
	import NavLink from './NavLink.svelte';

	let visible = false;
	const toggleNavVisibility = () => (visible = !visible);
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-static-element-interactions -->
<!-- <nav class="font-semibold uppercase text-white"> -->
<nav class="absolute left-0 top-0 z-30 font-semibold uppercase text-white">
	<div
		class="invisible fixed left-[30px] top-[30px] z-20 md:visible"
		on:click={toggleNavVisibility}
	>
		<Burger {visible} />

		<!-- {#if visible} -->
		<ul class="relative z-20 pb-[22px] pt-[53px]" class:invisible={!visible}>
			<NavLink delay={0.05} iconName="house" text="Home" />
			<NavLink delay={0.1} iconName="user" text="About" />
			<NavLink delay={0.15} iconName="briefcase" text="Portfolio" />
			<NavLink delay={0.2} iconName="envelope-open" text="Contact" />
			<NavLink delay={0.25} iconName="comments" text="Blog" />
		</ul>
		<!-- {/if} -->

		<span
			aria-hidden="true"
			class="absolute left-0 top-0 z-10 h-[60px] w-[60px] rounded-[30px] bg-[#333] duration-200"
			class:h-full={visible}
		></span>
	</div>
</nav>
