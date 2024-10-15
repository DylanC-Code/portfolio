<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';

	interface IContactInfo {
		mode: string;
		value: string;
		logo: string;
	}

	const infosList: Array<IContactInfo> = [
		{ mode: 'Phone', value: '+33 6 50 32 29 56', logo: 'fa-solid fa-phone' },
		{ mode: 'Email', value: 'contact@dylan-castor.com', logo: 'fa-solid fa-envelope' },
		{ mode: 'Linkedin', value: 'dylan-code', logo: 'fa-brands fa-linkedin' }
	];

	const socialsMedias = [
		{ url: 'https://www.linkedin.com/in/dylan-code/', logo: 'fa-brands fa-linkedin-in' },
		{ url: 'https://www.linkedin.com/in/dylan-code/', logo: 'fa-brands fa-linkedin-in' },
		{ url: 'https://www.linkedin.com/in/dylan-code/', logo: 'fa-brands fa-linkedin-in' }
	];
</script>

<div class="mb-7 w-full flex-[0_0_100%] px-4 md:flex-[0_0_33%]">
	<div>
		<ul>
			{#each infosList as { logo, mode, value }}
				<li>
					<h6 class="normal-case">
						<span class="mb-2 block font-openSans text-[15px] capitalize leading-[18px] opacity-80"
							>{mode}</span
						>
						<i class="{logo} text-{$selectedColor} bg-transparent pr-3 duration-[.4s]"></i>
						<span class="font-openSans text-[17px] font-medium leading-5">{value}</span>
					</h6>
				</li>
			{/each}
		</ul>
	</div>

	<div class="mb-5 mt-7">
		<h6 class="mb-2 block font-openSans text-[15px] capitalize opacity-80">Social profiles</h6>
		<ul class="m-0 flex gap-x-4">
			{#each socialsMedias as { logo, url }}
				<li>
					<a
						href={url}
						target="_blank"
						class="border-{$selectedColor} text-{$selectedColor} hover:bg-{$selectedColor} block h-9 w-9 rounded-full border text-center leading-9"
					>
						<i class="fa-brands fa-{logo} text-{$selectedColor} bg-transparent duration-[.4s]"></i>
					</a>
				</li>
			{/each}
		</ul>
	</div>
</div>

<style>
	li:not(:last-child) {
		padding-bottom: 25px;
	}

	i {
		transform: rotateY(0deg);
	}

	a:hover i {
		transform: rotateY(360deg);
		color: #fff;
	}
</style>
