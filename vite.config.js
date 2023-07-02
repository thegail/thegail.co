import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig, loadEnv } from 'vite';

export default defineConfig(({ mode }) => {
	let env = loadEnv(mode, process.cwd());
	let version;
	if (mode === 'production') {
		version = env.VERCEL_GIT_COMMIT_SHA.slice(0, 8);
	} else {
		version = 'local';
	}
	let date = new Date().toLocaleDateString('en-US', {
		month: 'long',
		day: '2-digit',
		year: 'numeric'
	});

	return {
		define: {
			__VERSION__: JSON.stringify(version),
			__BUILD_DATE__: JSON.stringify(date)
		},
		plugins: [sveltekit()]
	};
});
