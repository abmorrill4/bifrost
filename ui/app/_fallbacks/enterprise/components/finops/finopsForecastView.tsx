import FinOpsPlaceholderView from "./finopsPlaceholderView";

export default function FinOpsForecastView() {
	return (
		<FinOpsPlaceholderView
			title="Forecast AI spend and catch anomalies"
			description="This feature is a part of the Bifrost enterprise license. Forecast the month against your budgets and get alerted when spend spikes."
			testIdPrefix="finops-forecast"
		/>
	);
}