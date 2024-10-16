<script lang="ts">
	import PageTitle from '$components/PageTitle/PageTitle.svelte';
	import { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';
	import type { IProject } from '$types/index';
	// import ProjectInfo from './ProjectInfo/ProjectInfo.svelte';

	// const projects: Array<IProject> = [
	// 	{
	// 		format: 'Image',
	// 		name: 'Website',
	// 		budget: { devise: 'USD', price: 1500 },
	// 		client: 'Ecom Wisdom Media',
	// 		duration: '5 months',
	// 		technologies: ['React', 'Shopify'],
	// 		img: '/project-1.jpg',
	// 		url:"https://google.com"
	// 	}
	// ];
	export let projects: Array<IProject>;

	let openedProject: number | null = null;

	const closeProjectHandler = () => (openedProject = null);
</script>

<PageTitle
	titleFirstPart="my"
	titleSecondPart="portfolio"
	subTitle="a few recent design and coding projects. Want to see more? Email me.
"
/>

<main class="px-6">
	<ul class="flew-wrap flex">
		{#each projects as project, index}
			<!-- {@const opened = index === openedProject} -->
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
			<li
				class="mb-6 w-full overflow-hidden bg-{$selectedColor} flex items-center justify-center rounded"
				on:click={navigator.gotoSetter(`project-${index}`)}
			>
				<!-- <li
				class="mb-6 w-full overflow-hidden bg-{$selectedColor} flex items-center justify-center rounded"
				on:click={() => (openedProject = index)}
			> -->
				<img src={project.img} alt="Project {index}" class="duration-200" />
				<p class="absolute text-center text-xl font-medium uppercase opacity-0 duration-200">
					{project.name}
				</p>
			</li>

			<!-- <ProjectInfo {opened} {project} {closeProjectHandler} /> -->
		{/each}
	</ul>
	<!-- <div
		class="fixed left-0 top-0 z-10 h-full w-full bg-black opacity-80"
		class:hidden={openedProject === null}
		on:click={closeProjectHandler}
	></div> -->
</main>

<style>
	li:hover > img {
		opacity: 0;
	}

	li:hover > p {
		opacity: 100;
	}
</style>
