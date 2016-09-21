var AllCompanies = React.createClass({
  handleDelete(id) {
    this.props.handleDelete(id);
  },

  render() {
    var companies = this.props.companies.map((company) => {
      return (
        <div key={company.id}>
          <h3>{company.name}</h3>
          <button onClick={this.handleDelete.bind(this, company.id)}>Delete</button>
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
