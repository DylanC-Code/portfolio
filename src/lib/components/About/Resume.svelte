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

	const experiencePhases: Array<IPhase> = [
		{
			date: 'January 2023 - August 2024',
			entity: 'Oneida Recherche Service',
			role: 'Developer & Devops',
			resume:
				'Experienced in building scalable backend APIs using Node.js with MySQL for relational databases, integrating CouchDB for document-based data, and implementing caching with Redis. Skilled in Svelte front-end development, optimizing UI performance, and code splitting. Expertise in managing on-premise infrastructure using Docker for containerization and VMware for virtual machine orchestration, ensuring scalable, secure deployments and automated resource management.'
		},
		{
			date: 'August 2021 - October 2022',
			entity: 'Ecom Wisdom Media',
			role: 'Developer & Devops',
			resume:
				'Experienced in building scalable Node.js backends with secure APIs and optimizing PostgreSQL performance. Skilled in React front-end development with Next.js, and managing DevOps pipelines and AWS cloud infrastructure using Terraform, Docker, and GitHub Actions for automated CI/CD.'
		}
	];
	const educationPhases: Array<IPhase> = [
		{
			date: 'April 2024 - now',
			entity: 'Cisco Networking Academy',
			role: 'Networking Basics - Cisco Certified',
			resume:
				'A foundational networking course, covering essential Cisco networking concepts, such as routing, switching, IP addressing, and network security.'
		},
		{
			date: 'January 2024 - March 2024',
			entity: 'HashiCorp Learn',
			role: 'Terraform Associate Certification',
			resume:
				'An official HashiCorp Terraform certification course, teaching infrastructure as code (IaC), state management, and advanced provisioning techniques for multi-cloud environments.'
		},
		{
			date: 'October 2023 - December 2023',
			entity: 'A Cloud Guru',
			role: 'Docker & Kubernetes Certification',
			resume:
				'A hands-on course focusing on containerization with Docker and orchestration with Kubernetes. Covers scaling, networking, and deploying applications in production environments.'
		},
		{
			date: 'August 2023 - September 2023',
			entity: 'Udemy',
			role: 'Svelte & SvelteKit: The Complete Guide',
			resume:
				'An in-depth course on Svelte and SvelteKit for building highly reactive and SEO-friendly web applications. Topics include routing, data fetching, and advanced component techniques.'
		},
		{
			date: 'May 2023 - July 2023',
			entity: 'Udemy',
			role: 'Jobs, Pipelines, CI/CD and DevOps..',
			resume:
				'A detailed certification course on implementing continuous integration and continuous delivery pipelines using GitHub Actions and Jenkins, automating build, test, and deployment processes.'
		},
		{
			date: 'February 2023 - April 2023',
			entity: 'Coursera',
			role: 'React/Next.js Certification',
			resume:
				'A comprehensive program on React and Next.js, covering server-side rendering (SSR), static site generation (SSG), and advanced state management with Redux and Context API.'
		},
		{
			date: 'November 2022 - January 2023',
			entity: 'Udemy',
			role: 'Node JS: Advanced Concepts',
			resume:
				'An advanced Node.js course focusing on performance optimization, security practices, and scalable architecture. Covers topics like streams, workers, vm, and advanced asynchronous programming.'
		},
		{
			date: 'October 2021 - October 2022',
			entity: 'Access Code School',
			role: 'Associate Degree',
			resume:
				'A web and mobile development program focused on building efficient applications using modern technologies. It covers front-end, back-end, and mobile development, including database integration and UI/UX design practices.'
		}
	];
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
