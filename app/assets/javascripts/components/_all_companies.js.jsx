var AllCompanies = React.createClass({
  handleDelete(id) {
    this.props.handleDelete(id);
  },

  onUpdate(company) {
    this.props.onUpdate(company);
  },

  render() {
    var companies= this.props.companies.map((company) => {
      return (
        <div key={company.id}>
          <Company company={company}
            handleDelete={this.handleDelete.bind(this, company.id)}
            handleUpdate={this.onUpdate}/>
        </div>
      )
    });

    return(
      <div>
        {companies}
      </div>
    )
  }
});
