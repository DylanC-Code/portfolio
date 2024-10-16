<script lang="ts">
	import Button from '$components/Button/Button.svelte';
	import { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';
	import type { IProject } from '$types/index';

	export let project: IProject;

	const infosLabels = [
		{
			logo: 'fa-solid fa-file-text',
			name: 'Project',
			value: project.name
		},
		{
			logo: 'fa-solid fa-user',
			name: 'Client',
			value: project.client
		},
		{
			logo: 'fa-solid fa-hourglass',
			name: 'Duration',
			value: project.duration
		},
		{
			logo: 'fa-solid fa-code',
			name: 'Technologies',
			value: project.technologies.join(' | ')
		},
		{
			logo: 'fa-solid fa-money-bill',
			name: 'Budget',
			value: `${project.budget.price} ${project.budget.devise}`
		}
	];
</script>

<div class="relative h-full w-full">
	<div
		class="absolute left-0 top-0 z-10 h-full w-full bg-black opacity-70"
		on:click={navigator.comeback}
	></div>

	<!-- <div class="right-0 z-20 h-full w-full bg-surface-50 p-6 duration-200 lg:w-[760px]"> -->
	<div class="absolute right-0 z-10 h-full w-full bg-surface-50 p-6 duration-200 lg:w-[760px]">
		<div class="pb-8"><img src={project.img} alt={project.name} class="rounded" /></div>
		<div>
			<h3
				class="uppercase text-{$selectedColor} mb-6 font-poppins text-[34px] font-bold leading-[26px]"
			>
				{project.format} format
			</h3>

			<ul class="mb-3">
				{#each infosLabels as label}
					<li class="pb-3 font-openSans text-[15px] leading-7 text-white">
						<i class="{label.logo} inline-block w-6"></i>
						<span>{label.name} :</span>
						<span class="font-semibold uppercase">{label.value}</span>
					</li>
				{/each}
			</ul>

			<Button
				text="preview"
				elementClasses={{
					icon: 'fa-solid fa-arrow-up-right-from-square',
					button: `bg-${$selectedColor}`
				}}
			/>
		</div>
	</div>
</div>
