<script lang="ts">
	import type { IPhase } from '$types/index';
	import Timeline from './Timeline.svelte';

	const skillsImagesName = [
		'nodejs.svg',
		'python.svg',
		'bash.svg',
		'react.svg',
		'svelte.svg',
		'docker.svg',
		'kubernetes.svg',
		'terraform.svg',
		'github.svg',
		'jenkins.svg',
		'aws.svg'
	];

	const resume =
		'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet diam nonummy.';
	const experiencePhases: Array<IPhase> = [
		{ date: '2017 - 2019', entity: 'Envato', role: 'web designer', resume },
		{ date: '2017 - 2019', entity: 'Envato', role: 'web designer', resume },
		{ date: '2017 - 2019', entity: 'Envato', role: 'web designer', resume }
	];
	const educationPhases: Array<IPhase> = experiencePhases;
</script>

<section class="mx-auto w-full max-w-[1170px] px-6 sm:px-[30px]">
	<div class="-mx-[15px] flex flex-wrap">
		<Timeline timelineName="Experiences" phases={experiencePhases} />
		<Timeline timelineName="Education" phases={educationPhases} />

		<div class="w-full py-12">
			<h2 class="mb-12 px-4 font-poppins text-2xl font-semibold uppercase">Skills</h2>

			<ul class="flex flex-wrap justify-around gap-4">
				{#each skillsImagesName as imageName}
					{@const [name] = imageName.split('.')}
					{@const src = `skills/${imageName}`}

					<li class="mb-5 flex-[28%] text-center md:flex-[1_1_22%] lg:flex-[1_1_18%]">
						<div class="justify-content mb-[10px] flex h-[100px] w-full items-center">
							<img {src} alt={name} class="mx-auto h-full w-full max-w-[100px] object-contain" />
						</div>
						<h4 class="h4 mt-3 font-semibold">{name}</h4>
					</li>
				{/each}
			</ul>
		</div>
	</div>
</section>
