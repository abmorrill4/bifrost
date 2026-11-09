import FinOpsPlaceholderView from "./finopsPlaceholderView";

export default function FinOpsExplorerView() {
	return (
		<FinOpsPlaceholderView
			title="Break AI spend down by model and account"
			description="This feature is a part of the Bifrost enterprise license. Compare invoiced spend with what Bifrost logged, model by model."
			testIdPrefix="finops-explorer"
		/>
	);
}