import FinOpsPlaceholderView from "./finopsPlaceholderView";

export default function FinOpsConnectionsView() {
	return (
		<FinOpsPlaceholderView
			title="Connect provider billing accounts"
			description="This feature is a part of the Bifrost enterprise license. Connect OpenAI, Anthropic, AWS Bedrock, Vertex AI and Azure OpenAI billing with read-only access."
			testIdPrefix="finops-connections"
		/>
	);
}