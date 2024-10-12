<script lang="ts">
	import { _currentPage } from '../../../routes/+layout';

	const changePageHandler = (pageName: string) => () => _currentPage.set(pageName);
</script>

<div class="md:hidden" class:hidden={$_currentPage !== 'home'}>
	<ul class="flex flex-col h-screen p-6 gap-6">
		<li class="nav-card">
			<a href="#about" class="nav-link" on:click={changePageHandler('about')}>
				<i class="fa fa-user nav-icon"></i>
				<span>About me</span>
			</a>
		</li>

		<li class="nav-card">
			<a href="#portfolio" class="nav-link" on:click={changePageHandler('portfolio')}>
				<i class="fa fa-briefcase nav-icon"></i>
				<span>My portfolio</span>
			</a>
		</li>

		<li class="nav-card">
			<a href="#contact" class="nav-link" on:click={changePageHandler('contact')}>
				<i class="fa fa-envelope-open nav-icon"></i>
				<span>Get in touch</span>
			</a>
		</li>

		<li class="nav-card">
			<a href="#blog" class="nav-link" on:click={changePageHandler('blog')}>
				<i class="fa fa-comments nav-icon"></i>
				<span>My blog</span>
			</a>
		</li>
	</ul>
</div>
