var Body = React.createClass({
  getInitialState() {
    return { companies: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/companies.json', (response) => { this.setState({ companies: response }) });
  },

  handleSubmit(company) {
    var newState = this.state.companies.concat(company);
    this.setState({ companies: newState })
  },

  handleDelete(id) {
    $.ajax({
      url: `/api/v1/companies/${id}`,
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

  handleUpdate(company) {
    $.ajax({
      url: `/api/v1/companies/${company.id}`,
      type: 'PUT',
      data: { company: company },
      success: () => {
        this.updateCompanies(company);
      }
    });
  },

  updateCompanies(company) {
    var companies = this.state.companies.filter((i) => { return i.id != company.id });
    companies.push(company);
    this.setState({companies: companies });
  },

  render() {
    return (
      <div>
        <NewCompany handleSubmit={this.handleSubmit}/>
        <AllCompanies companies={this.state.companies}  handleDelete={this.handleDelete} onUpdate={this.handleUpdate}/>
      </div>
    )
  }
});
