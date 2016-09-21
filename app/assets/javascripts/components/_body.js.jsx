var Body = React.createClass({
  getInitialState() {
    return { companies: [] }
  },

  componentDidMount() {
    $.getJSON('api/v1/companies.json', (response) => { this.setState({ companies: response }) });
  },

  handleSubmit(company) {
    var newState = this.state.companies.concat(company);
    this.setState({ companies: newState })
  },

  handleDelete(id) {
    $.ajax({
      url: '/api/v1/companies/${id}',
      type: 'DELETE',
      success:() => {
        this.removeCompanyClient(id);
      }
    });
  },

  removeCompanyClient(id) {
    var newCompanies = this.state.companies.filter((company) => {
      return company.id != id;
    });

    this.setState({ companies: newCompanies });
  },

  render() {
    return (
      <div>
        <NewCompany handleSubmit={this.handleSubmit}/>
        <AllCompanies companies={this.state.companies} handleDelete={this.handleDelete}/>
      </div>
    )
  }
});
