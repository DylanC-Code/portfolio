export interface IPhase {
	date: string;
	entity: string;
	role: string;
	resume: string;
}

export interface IProject {
	format: 'Image' | 'Video' | 'Slider';
	name: string;
	client: string;
	duration: Duration;
	technologies: Array<string>;
	budget: {
		price: number;
		devise: string;
	};
	img: string;
	url?: string;
}
