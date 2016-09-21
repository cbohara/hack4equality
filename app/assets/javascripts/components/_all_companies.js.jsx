var AllCompanies = React.createClass({
  getInitialState() {
    return { companies: [] }
  },

  componentDidMount() {
    $.getJSON('api/v1/companies.json', (response) => { this.setState({ companies: response }) });
  },

  render() {
    var companies = this.state.companies.map((company) => {
      return (
        <div key={company.id}>
          <h3>{company.name}</h3>
        </div>
      )
    });

    return (
      <div>
        {companies}
      </div>
    )
  }
});
