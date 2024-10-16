<script>
	import selectedColor from '$lib/stores/selectedColor';
	import Button from '../Button/Button.svelte';

	const downloadCVHandler = () => window.open('/cv.pdf', '_blank');

	const infosList1 = [
		{ label: 'First Name', value: 'Dylan' },
		{ label: 'Last Name', value: 'Castor' },
		{ label: 'Birthdate', value: '10 april 2000' },
		{ label: 'Nationality', value: 'French' },
		{ label: 'Experience', value: '3 - 5 years' }
	];
	const infosList2 = [
		{ label: 'Freelance', value: 'Available' },
		{ label: 'Languages', value: 'English | French' },
		{ label: 'Phone', value: '+33 6 50 32 29 56' },
		{ label: 'Email', value: 'contact@dylan-castor.com' }
	];
</script>

<div class="mx-auto max-w-[1170px] lg:px-7 xl:w-full">
	<div class="px-6 pb-5 sm:px-8 sm:pb-12 lg:mb-0">
		<div class="-mx-4 flex flex-wrap items-center">
			<div
				class="relative w-full px-4 sm:max-w-full sm:flex-[0_0_100%] lg:max-w-[50%] lg:flex-[0_0_50%]"
			>
				<div class="image-container relative mx-auto block max-w-[440px]">
					<div
						class="hidden border-[6px] sm:inline-block border-{$selectedColor} absolute bottom-0 left-0 right-0 top-0 -z-10 inline-block"
					></div>
					<img
						src="/dark-about.png"
						class="mx-auto mb-8 block h-auto max-w-full bg-black align-middle lg:m-0"
						alt="Dylan"
					/>
				</div>

				<p class="mb-[25px] mt-[60px] leading-8 md:hidden">
					I'm a Freelance UI/UX Designer and Developer based in London, England. I strives to build
					immersive and beautiful web applications through carefully crafted code and user-centric
					design.
				</p>
			</div>

			<div
				class="relative -mx-4 flex w-full flex-wrap px-4 md:mt-8 md:max-w-full md:flex-[0_0_100%] lg:mt-7 lg:max-w-[50%] lg:flex-[0_0_50%]"
			>
				<section class="relative w-full px-4 sm:max-w-[50%] sm:flex-[0_0_50%]">
					<ul class="-mt-2 mb-0 p-0 md:text-right lg:text-left">
						{#each infosList1 as { label, value }}
							<li class="relative pb-5 sm:last:pb-0">
								<h6 class="mb-0 mt-1 font-medium normal-case text-white">
									<span class="mb-2 block font-normal capitalize opacity-80 lg:inline lg:pr-5"
										>{label}</span
									>{value}
								</h6>
							</li>
						{/each}
					</ul>
				</section>

				<section class="relative w-full px-4 sm:max-w-[50%] sm:flex-[0_0_50%]">
					<ul class="-mt-2 mb-0 p-0">
						{#each infosList2 as { label, value }}
							<li class="relative pb-5 sm:last:pb-0">
								<h6 class="mb-0 mt-1 font-medium normal-case text-white">
									<span class="mb-2 block font-normal capitalize opacity-80 lg:inline lg:pr-5"
										>{label}</span
									>{value}
								</h6>
							</li>
						{/each}
					</ul>
				</section>

				<section
					class="relative w-full max-w-full flex-[0_0_100%] px-4 md:text-center lg:text-left"
				>
					<Button
						onClickHandler={downloadCVHandler}
						text="download my cv"
						elementClasses={{
							button: `mt-4 mb-9 sm:mt-8 sm:mb-0 bg-${$selectedColor}`,
							icon: 'fa-solid fa-download'
						}}
					></Button>
				</section>
			</div>
		</div>
	</div>
</div>

<style>
	.image-container > div {
		transform: translate3d(26px, 26px, -26px);
	}
</style>
