export default async () => {
	const Count = 1000000000;

	let Index = 0;

	while (Index < Count) {
		Index++;
	}

	console.info(
		`All is well. ${
			(
				await (
					await import("node:fs/promises")
				).readFile("@Target/Test/Calculation.js")
			).byteLength
		} bytes`,
	);

	return true;
};
