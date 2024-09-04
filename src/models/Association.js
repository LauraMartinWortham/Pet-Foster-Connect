import { Model, DataTypes } from 'sequelize';
import { sequelize } from '../database.js';

class Association extends Model {}

Association.init(
  {
    nom: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    responsable: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    rue: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    commune: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    code_postal: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    pays: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    SIRET: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    telephone: {
      type: DataTypes.TEXT,
      allowNull: false,
    }
  },
  {
    sequelize: sequelize,
    tableName: 'association'
  }
);

export { Association };

/**
 * A Association
 * @typedef  {object} Association
 * @property {string} id.required - Identifiant
 * @property {string} nom.required - Nom
 * @property {string} responsable - Responsable
 * @property {string} rue - Rue
 * @property {string} commune - Commune
 * @property {string} code_postal - Code Postal
 * @property {string} ville - Ville
 * @property {string} pays - Pays
 * @property {string} siret - N° SIRET
 * @property {string} telephone - N° téléphone
 */