<script>
	import selectedColor from "$lib/stores/selectedColor";
</script>

<div class="relative w-full px-4 md:max-w-[50%] md:flex-[0_0_50%]">
	<h2 class="mb-12 text-2xl font-semibold uppercase font-poppins">Experience</h2>
	<ul>
		<li>
			<span class="border-l-{$selectedColor} line"></span>
			<span class="border-{$selectedColor} bullet"></span>
			<div class="exp-card">
				<header>
					<span>
						<i class="fa fa-calendar"></i>
						<i class="fa fa-caret-right text-{$selectedColor}"></i>
						2017 - 2019
					</span>
					<span class="font-poppins uppercase block">
						web designer
						<span class="separator"></span>
						<span class="font-poppins uppercase font-semibold text-white">Envato</span>
					</span>
				</header>
				<main class="p-0 flex-[1_1_auto]">
					<p class="font-openSans text-sm leading-7">
						Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
						tincidunt ut laoreet diam nonummy.
					</p>
				</main>
			</div>
		</li>
		<li>
			<span class="border-l-{$selectedColor} line"></span>
			<span class="border-{$selectedColor} bullet"></span>
			<div class="exp-card">
				<header>
					<span>
						<i class="fa fa-calendar"></i>
						<i class="fa fa-caret-right text-{$selectedColor}"></i>
						2017 - 2019
					</span>
					<span class="font-poppins uppercase block">
						web designer
						<span class="separator"></span>
						<span class="font-poppins uppercase font-semibold text-white">Envato</span>
					</span>
				</header>
				<main class="p-0 flex-[1_1_auto]">
					<p class="font-openSans text-sm leading-7">
						Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
						tincidunt ut laoreet diam nonummy.
					</p>
				</main>
			</div>
		</li>
		<li>
			<span class="border-l-{$selectedColor} line"></span>
			<span class="border-{$selectedColor} bullet"></span>
			<div class="exp-card">
				<header>
					<span>
						<i class="fa fa-calendar"></i>
						<i class="fa fa-caret-right text-{$selectedColor}"></i>
						2017 - 2019
					</span>
					<span class="font-poppins uppercase block">
						web designer
						<span class="separator"></span>
						<span class="font-poppins uppercase font-semibold text-white">Envato</span>
					</span>
				</header>
				<main class="p-0 flex-[1_1_auto]">
					<p class="font-openSans text-sm leading-7">
						Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod
						tincidunt ut laoreet diam nonummy.
					</p>
				</main>
			</div>
		</li>
	</ul>
</div>

<style>
	li {
		position: relative;
		padding-bottom: 50px;
	}

	.bullet {
		@apply border-2 absolute left-0 h-[15px] top-0 w-[15px] rounded-full bg-surface-50 hidden md:block;
	}

	.line {
		@apply border absolute  content-[''] h-full left-[7px] opacity-60 top-0 w-[1px] md:block hidden;
	}

	.exp-card {
		@apply w-full relative flex flex-col break-words rounded-md md:ml-10 md:w-[calc(100%-39px)] bg-transparent;
	}

	header {
		@apply border-b-0 relative pt-8 pb-3;
	}

	header > span:first-of-type {
		@apply font-openSans absolute -top-[2px] text-xs opacity-80 font-normal;
	}

	i:first-of-type {
		@apply hidden md:inline-block pr-3;
	}

	i:last-of-type {
		@apply inline-block pr-3 md:hidden;
	}

	.separator {
		@apply inline-block w-2 h-[2px] mx-2 mb-[4px] bg-[#555];
	}
</style>
