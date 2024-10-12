<script>
	import { _selectedColor } from '../../routes/+layout';
</script>

<div class="xl:w-full lg:px-7 mx-auto max-w-[1170px]">
	<div class="px-6 pb-5 sm:px-8 sm:pb-12 lg:mb-0">
		<div class="items-center flex flex-wrap -mx-4">
			<div
				class="relative w-full px-4 sm:max-w-full sm:flex-[0_0_100%] lg:max-w-[50%] lg:flex-[0_0_50%]"
			>
				<div class="relative block max-w-[440px] mx-auto">
					<div
						class="hidden sm:inline-block border-[6px] border-{$_selectedColor} inline-block absolute top-0 right-0 bottom-0 left-0 -z-10"
					></div>
					<img
						src="dark-about.png"
						class="mx-auto mb-8 block max-w-full h-auto align-middle lg:m-0"
						alt="Dylan"
					/>
				</div>

				<p class="mt-[60px] mb-[25px] leading-8 md:hidden">
					I'm a Freelance UI/UX Designer and Developer based in London, England. I strives to build
					immersive and beautiful web applications through carefully crafted code and user-centric
					design.
				</p>
			</div>

			<div
				class="relative w-full px-4 flex flex-wrap -mx-4 md:mt-8 lg:mt-7 md:flex-[0_0_100%] md:max-w-full lg:max-w-[50%] lg:flex-[0_0_50%]"
			>
				<section class="info-section">
					<ul class="md:text-right lg:text-left">
						<li>
							<h6><span>First Name</span>Dylan</h6>
						</li>
						<li>
							<h6>
								<span>Last Name</span>
								Castor
							</h6>
						</li>
						<li>
							<h6>
								<span>Birthdate</span>
								10 avril 2000
							</h6>
						</li>
						<li>
							<h6>
								<span>Nationality</span>
								French
							</h6>
						</li>
						<li>
							<h6>
								<span>Experience</span>
								3 - 5 years
							</h6>
						</li>
						<li>
							<h6>
								<span>Address</span>
								France
							</h6>
						</li>
					</ul>
				</section>

				<section class="info-section">
					<ul class="">
						<li>
							<h6><span>Freelance</span>Available</h6>
						</li>
						<li>
							<h6>
								<span>Langages</span>
								English | French
							</h6>
						</li>
						<li>
							<h6>
								<span>Phone</span>
								+33 6 50 32 29 56
							</h6>
						</li>
						<li>
							<h6>
								<span>Email</span>
								contact@dylan-castor.com
							</h6>
						</li>
					</ul>
				</section>

				<section
					class="flex-[0_0_100%] max-w-full relative w-full px-4 md:text-center lg:text-left"
				>
					<a href="#" class="mt-4 mb-9 bg-{$_selectedColor} btn sm:mt-8 sm:mb-0">
						<div class="bg-[#555]"></div>
						<span><i class="fa fa-download"></i>download my cv</span>
					</a>
				</section>
			</div>
		</div>
	</div>
</div>

<style>
	div > div > div > div > div {
		transform: translate3d(26px, 26px, -26px);
	}

	img {
		background-color: black;
	}

	ul {
		@apply p-0 -mt-2 mb-0;
	}

	li {
		@apply relative;
	}

	li:not(:last-child) {
		padding-bottom: 21px;
	}

	h6 {
		@apply text-white mt-1 font-medium normal-case mb-0;
	}

	h6 > span {
		@apply block capitalize mb-2 font-normal opacity-80 lg:pr-5  lg:inline;
	}

	.info-section {
		@apply relative w-full px-4 sm:flex-[0_0_50%] sm:max-w-[50%];
	}
</style>
